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
            'from_warehouse_id' => 'required|numeric|min:1',
            'to_warehouse_id'   => 'required|numeric|min:1',
            'ItemID'            => 'required|numeric|min:1',
            'qty'               => 'required|numeric|min:1'
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
            'from_warehouse_id.required' => 'Please select from warehouse',
            'to_warehouse_id.required'   => 'Please select to warehouse.',
            'ItemID.required'            => 'Please select item.',
            'qty.required'               => 'Please enter quantity.', 
            
            'from_warehouse_id.numeric' => 'Please select from warehouse',
            'to_warehouse_id.numeric'   => 'Please select to warehouse.',
            'ItemID.numeric'            => 'Please select one item.',
            'qty.numeric'               => 'Please enter minimum one quantity.',
            
        ];
    }
}
