<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'ItemID'         => ['required'],
            'to_warehouse_id'    => 'required|string',
            'from_warehouse_id'  => 'required|string',
            'qty'=>'required'
        ];
    }

    /**
     * Show the Messages for rules above.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'ItemID.required' => 'Please select item.',
            'from_warehouse_id.required' => 'Please select target warehouse',
            'to_warehouse_id.required' => 'Please select destination warehouse.',
            'qty.required' => 'Please enter quantity.',
        ];
    }
}
