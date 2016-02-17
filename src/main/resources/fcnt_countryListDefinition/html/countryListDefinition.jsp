<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form.$dirty}"
     ng-show="resolveLogic()">
    <label class="control-label">
        {{input.label}}
    </label>

    <select name="{{input.name}}"
            class="form-control"
            ng-model="input.value"
            ng-required="isRequired()"
            ng-options="country as country.country.name for country in countries"
            ng-disabled="readOnly"
            ff-validations
            ff-logic>
        <option value="">{{input.placeholder}}</option>
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