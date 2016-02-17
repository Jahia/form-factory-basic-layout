<!-- Text input-->
<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>

    <input type="text"
           placeholder="{{input.placeholder}}"
           class="form-control {{input.inputsize}}"
           name="{{input.name}}"
           ng-model="input.value"
           ng-required="isRequired()"
           ng-readonly="readOnly"
           ff-validations
           ff-logic>
    <span class="help-block"
          ng-show="input.helptext != undefined">
        {{input.helptext}}
    </span>
    <span class="help-block"
          ng-repeat="(validationName, validation) in input.validations"
          ng-show="form[input.name].$error[(validationName | normalize)]&&form.$dirty">
        {{validation.message}}
    </span>
    <div class="clearfix"/>
</div>