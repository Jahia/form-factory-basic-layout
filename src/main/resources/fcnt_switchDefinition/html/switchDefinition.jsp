<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>
    <div class="col-sm-12">
        <span class="switch {{input.inputsize}}"
              ng-click="readOnly ? input.value : input.value =! input.value"
              ng-class="{'{{input.color}}' : input.value, 'disabled' : readOnly}">
            <small></small>
            <input style="display:none;"
                   type="checkbox"
                   name="{{input.name}}"
                   ng-model="input.value"
                   ff-logic>
            <span class="switch-text" ng-show="input.displayText">
                <span class="on">{{input.textOn}}</span>
                <span class="off">{{input.textOff}}</span>
            </span>
        </span>
        <span class="help-block"
              ng-show="input.helptext != undefined">
            {{input.helptext}}
        </span>
    </div>
    <div class="clearfix"/>
</div>