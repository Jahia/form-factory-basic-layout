<!-- Multiple Checkboxes (inline) -->
<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>

    <div ff-validations ff-logic>
        <label class="checkbox-inline" ng-repeat="checkboxOption in input.checkboxes">
            <input type="checkbox"
                   name="{{input.name}}" checklist-model="input.value"
                   ng-required="checkValues()"
                   checklist-value="checkboxOption.key"
                   checklist-change="makeDirty(); ffValidate()"
                   ng-model-options="{'allowInvalid':true}"
                   ng-disabled="readOnly">
            {{checkboxOption.value}}
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
    <div class="clearfix"/>
</div>