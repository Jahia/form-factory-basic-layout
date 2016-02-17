<!-- Date picker-->
<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <%--Live mode--%>
    <input ng-if="!readOnly"
           type="hidden"
           name="{{input.name}}"
           ng-model="input.value"
           value="{{input.value}}"
           ng-required="isRequired()"
           ff-validations
           ff-logic
           ff-date-picker-validator>
    <%--Builder mode--%>
    <input ng-if="readOnly"
           type="hidden"
           name="{{input.name}}"
           ng-model="input.value"
           value="{{input.builderValue}}"
           ng-required="isRequired()"
           ff-validations
           ff-logic>
    <label class="control-label">
        {{input.label}}
    </label>
    <%--Live mode--%>
    <ff-date-picker ng-if="!readOnly"
                    read-only="{{datePicker.isDisabled}}"
                    is-disabled="{{datePicker.isDisabled}}"
                    min-date-placeholder="datePicker.placeholder"
                    date-picker-options="datePicker.datePickerOptions"
                    min-value="input.value">
    </ff-date-picker>
    <%--Builder mode--%>
    <ff-date-picker ng-if="readOnly"
                    read-only="{{datePicker.isDisabled}}"
                    is-disabled="{{datePicker.isDisabled}}"
                    min-date-placeholder="datePicker.placeholder"
                    date-picker-options="datePicker.datePickerOptions"
                    min-value="input.builderValue">
    </ff-date-picker>
    <span class="help-block"
          ng-show="input.helptext != undefined">
        {{input.helptext}}
    </span>
    <span class="help-block"
          ng-repeat="(validationName, validation) in input.validations"
          ng-show="form[input.name].$error[(validationName | normalize)]&&form.$dirty">
        {{validation.message}}
    </span>
    <span class="help-block"
          ng-repeat="errorMessage in errorMessages"
          ng-if="errorMessage.active">
        {{errorMessage.message}}
    </span>
    <div class="clearfix"/>
</div>