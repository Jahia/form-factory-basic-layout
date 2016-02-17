<form novalidate name="{{vm.formName}}" ng-model-options="{updateOn:'default blur', debounce: { default: 0, blur: 0 } }">
    <ff-input ng-if="!vm.isLayoutAvailable"
              input="input"
              ng-repeat="input in vm.inputs"
              resolve-logic="vm.resolveLogic(input, vm.getFormController())"
              resolve-placeholder="vm.resolvePlaceholder(input)"
              resolve-inputsize="vm.resolveInputsize(input)"
              resolve-name="vm.resolveName(input)"
              resolve-label="vm.resolveLabel(input)">
    </ff-input>
    <div class="row"
         ng-if="vm.isLayoutAvailable"
         ng-repeat="rows in vm.currentForm.layoutJson.steps[vm.currentStep].rows">
        <div class="{{cols.col}} {{cols.offset}}"
             ng-repeat="cols in rows.row">
            <div ng-if="cols.input !== null">
                <ff-input input="vm.inputs[vm.preparedLayoutInputs[cols.input]]"
                          resolve-logic="vm.resolveLogic(vm.inputs[vm.preparedLayoutInputs[cols.input]], vm.getFormController())"
                          resolve-placeholder="vm.resolvePlaceholder(vm.inputs[vm.preparedLayoutInputs[cols.input]])"
                          resolve-inputsize="vm.resolveInputsize(vm.inputs[vm.preparedLayoutInputs[cols.input]])"
                          resolve-name="vm.resolveName(vm.inputs[vm.preparedLayoutInputs[cols.input]])"
                          resolve-label="vm.resolveLabel(vm.inputs[vm.preparedLayoutInputs[cols.input]])">
                </ff-input>
            </div>
        </div>
    </div>

    <div class="row" ng-if="vm.getCaptchaKey() !== null && vm.currentForm.steps.length-1 === vm.currentStep && vm.currentForm.displayCaptcha">
        <div class="col-sm-12 text-right">
            <div vc-recaptcha theme="'light'" key="vm.getCaptchaKey()"></div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button class="btn btn-sm" type="button"
                    ng-click="vm.update(false)"
                    ng-disabled="vm.getFormController().$submitted"
                    ng-show="vm.currentStep>0&&!vm.isSubmitted()"
                    message-key="angular.ffController.button.previousStep">
            </button>
            <button class="btn btn-sm btn-primary"
                    type="button" ng-click="vm.update(true)"
                    ng-disabled="vm.getFormController().$invalid || vm.getFormController().$submitted || vm.isPreviewMode"
                    ng-show="vm.currentStep==vm.currentForm.steps.length-1&&!vm.isSubmitted()"
                    message-key="angular.ffController.button.submit">
            </button>
            <button class="btn btn-sm"
                    type="button"
                    ng-click="vm.update(true)"
                    ng-disabled="vm.getFormController().$invalid || vm.getFormController().$submitted"
                    ng-show="vm.currentStep<vm.currentForm.steps.length-1&&!vm.isSubmitted()"
                    message-key="angular.ffController.button.nextStep">
            </button>
            <button class="btn btn-sm btn-danger"
                    type="button" ng-click="vm.reset()"
                    ng-disabled="vm.getFormController().$submitted || vm.currentForm.steps[vm.currentStep].resetDisabled"
                    ng-show="!vm.isSubmitted()"
                    message-key="angular.ffController.button.reset">
            </button>
        </div>
    </div>
</form>