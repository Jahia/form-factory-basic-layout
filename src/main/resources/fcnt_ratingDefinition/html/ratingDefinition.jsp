<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>

    <div class="col-sm-12">
        <input type="hidden"
               name="{{input.name}}"
               ng-model="input.value"
               ng-required="isRequired()"
               ff-validations
               ff-logic>
        <span ng-mouseleave="reset()"
              ng-keydown="onKeydown($event)"
              tabindex="0"
              role="slider"
              aria-valuemin="0"
              aria-valuemax="{{range.length}}"
              aria-valuenow="{{value}}">
          <span ng-repeat-start="r in range track by $index" class="sr-only"></span>
            <i ng-repeat-end
               ng-mouseenter="enter($index + 1)"
               ng-click="rate($index + 1)"
               class="fa {{r.iconSize}}"
               ng-class="$index < value && (r.stateOn || 'fa-star') || (r.stateOff || 'fa-star-o')">
            </i>
           </span>
        </span>
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