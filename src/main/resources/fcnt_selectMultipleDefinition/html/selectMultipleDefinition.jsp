<!-- Select multiple-->
<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>
    <select multiple
            type="select"
            class="form-control {{input.inputsize}}"
            name="{{input.name}}"
            ng-model="input.value"
            ng-model-options="{'allowInvalid':true}"
            ng-required="isRequired()"
            ng-disabled="readOnly"
            ff-validations
            ff-logic>
        <option ng-repeat="option in input.options" value="{{option.key}}">{{option.value}}</option>
    </select>
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