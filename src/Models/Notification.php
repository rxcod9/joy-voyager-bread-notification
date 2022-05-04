<?php

namespace Joy\VoyagerBreadNotification\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Notifications\DatabaseNotification;
use Illuminate\Support\Facades\Auth;
use Ramsey\Uuid\Uuid;
use TCG\Voyager\Facades\Voyager;

class Notification extends DatabaseNotification
{
    public const ACTIVE   = 'ACTIVE';
    public const INACTIVE = 'INACTIVE';
    public const EXPIRED  = 'EXPIRED';

    protected $guarded = [];

    public function save(array $options = [])
    {
        // If no created_by has been assigned, assign the current user's id as the created_by of the post
        if (!$this->created_by_id && Auth::user()) {
            $this->created_by_id = Auth::user()->getKey();
        }

        if (Auth::user()) {
            $this->modified_by_id = Auth::user()->getKey();
        }

        if (empty($this->{$this->getKeyName()})) {
            $this->{$this->getKeyName()} = Uuid::uuid4()->toString();
        }

        return parent::save();
    }

    public function createdBy()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'created_by_id', 'id');
    }

    public function modifiedBy()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'modified_by_id', 'id');
    }

    public function assignedTo()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'assigned_to_id', 'id');
    }

    /**
     * Scope a query to only active scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeActive(Builder $query)
    {
        return $query->where('status', '=', static::ACTIVE);
    }

    /**
     * Scope a query to only inactive scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeInactive(Builder $query)
    {
        return $query->where('status', '=', static::INACTIVE);
    }

    /**
     * Scope a query to only expired scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeExpired(Builder $query)
    {
        return $query->where('status', '=', static::EXPIRED);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function parent()
    {
        return $this->belongsTo(Voyager::modelClass('Notification'));
    }
}
