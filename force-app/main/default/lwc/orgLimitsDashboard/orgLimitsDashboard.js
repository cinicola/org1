import { LightningElement, track } from 'lwc';
import getOrgLimits from '@salesforce/apex/OrgLimitsController.getOrgLimits';

export default class OrgLimitsDashboard extends LightningElement {
    autoRefreshInterval = null;
    @track orgLimits = {};
    @track onlyUsedState = true;
    @track autoRefreshState = false;

    connectedCallback() {
        this.loadLimits();
    }

    loadLimits() {
        getOrgLimits({onlyUsed : this.onlyUsedState}).then(retorno => {
            this.orgLimits = JSON.parse(retorno);
        }).catch(erro => {

        }).finally(() => {

        });
    }

    handleOnlyUsedButtonClick() {
        this.onlyUsedState = !this.onlyUsedState;
        this.loadLimits();
    }

    handleAutoRefreshButtonClick() {
        this.autoRefreshState = !this.autoRefreshState;
        if (this.autoRefreshState) {
            this.autoRefreshInterval = setInterval(() => {this.loadLimits()}, 5000);
        }
        else {
            clearInterval(this.autoRefreshInterval);
        }
    }
}