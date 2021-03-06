<!-- Multiple Radios (inline) -->
<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>

    <div>
        <label class="radio-inline" ng-repeat="(radiok, radiov) in input.radios">
            <input type="radio"
                   name="{{input.name}}"
                   ng-model="input.value"
                   ng-model-options="{'allowInvalid':true}"
                   value="{{radiov.key}}"
                   ng-required="isRequired()"
                   ng-disabled="readOnly"
                   ng-change="makeDirty()"
                   ff-validations
                   ff-logic>
            {{radiov.value}}
        </label>
        <span class="help-block"
              ng-show="input.helptext != undefined">
            {{input.helptext}}
        </span>
        <span class="help-block"
              ng-repeat="(validationName, validation) in input.validations"
              ng-show="form[input.name].$error[(validationName | normalize)]&&form.$dirty">
                {{validation.message}}
        </span>
    </div>
</div>
<div class="clearfix"/>