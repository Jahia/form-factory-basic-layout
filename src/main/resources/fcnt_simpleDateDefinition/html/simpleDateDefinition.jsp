<!-- Simple date-->
<div class="form-group"
     ng-class="{'has-error': (form[input.name].$invalid&&form.$dirty) || (form.selectYear.$invalid && form.selectYear.$dirty)}"
     ng-show="resolveLogic()">
    <input type="hidden"
           name="{{input.name}}"
           ng-model="input.value"
           ng-required="isRequired()"
           ff-validations
           ff-logic>
    <label class="control-label">
        {{input.label}}
    </label>

    <div class="row">
        <div class="col-sm-4">
            <div class="input-group" role="group">
                <input class="form-control {{input.inputsize}}"
                       name="selectYear"
                       type="number"
                       placeholder="{{input.placeholder[0]}}"
                       ng-model="date.selectedYear"
                       ng-model-options="{ allowInvalid: true, updateOn: 'default', debounce: {'default': 0} }"
                       ng-change="updateDateModel()"
                       ng-readonly="readOnly || input.useCurrentDate"
                       min="{{date.minYear}}"
                       max="{{date.maxYear}}"
                       ff-valid-year>
                <span class="input-group-btn">
                    <button type="button"
                            class="btn btn-default dropdown-toggle {{buttonSize(input.inputsize)}}"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            ng-disabled="readOnly || input.useCurrentDate">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu-right dropdown-menu scrollable-menu"
                        role="menu">
                        <li ng-repeat="year in date.years | orderBy : year : true">
                            <a href="" ng-click="$event.preventDefault(); date.selectedYear=year.id; updateDateModel()">{{year.id}}</a>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="input-group" role="group">
                <input class="form-control {{input.inputsize}}"
                       name="selectMonth"
                       type="text"
                       placeholder="{{input.placeholder[1]}}"
                       ng-model="date.selectedMonth"
                       ng-readonly="true">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle {{buttonSize(input.inputsize)}} "
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            ng-disabled="readOnly || input.useCurrentDate">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu-right dropdown-menu scrollable-menu"
                        role="menu">
                        <li ng-repeat="month in date.months">
                            <a href="" ng-click="$event.preventDefault(); date.selectedMonth=month.id; updateDateModel()">{{month.id}}</a>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="input-group" role="group">
                <input class="form-control {{input.inputsize}}"
                       name="selectDay"
                       type="text"
                       placeholder="{{input.placeholder[2]}}"
                       ng-model="date.selectedDay"
                       ng-readonly="true">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle {{buttonSize(input.inputsize)}}"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            ng-disabled="readOnly || input.useCurrentDate">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu-right dropdown-menu scrollable-menu"
                        role="menu">
                        <li ng-repeat="day in date.days" ng-show="day.displayable">
                            <a href="" ng-click="$event.preventDefault(); date.selectedDay=day.id; updateDateModel()">{{day.id}}</a>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
    </div>
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
          ng-repeat="(errorMessageName, errorMessage) in errorMessages">
        <span ng-if="errorMessage" message-key="{{errorMessageName}}"></span>
    </span>
</div>
<div class="clearfix"/>