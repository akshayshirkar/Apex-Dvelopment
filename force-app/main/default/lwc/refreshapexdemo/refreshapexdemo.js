import { LightningElement, wire } from 'lwc';
import getApexData from '@salesforce/apex/getAccounts.getAccounts';
import { deleteRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Website', fieldName: 'Website', type: 'url' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
];

export default class Refreshapexdemo extends LightningElement {
    columns = columns;
    accounts;
    selectedRecords;
    wiredaccounts;

    @wire(getApexData)
    wiredAccounts(value) {
        this.wiredaccounts = value;
        this.accounts = value.data;
    }

    handleselectrow(event){
        this.selectedRecords = event.detail.selectedRows[0].id;
        console.log(event.detail);
    }
    handleClick(){
        console.log('handleClick is called')
        deleteRecord(this.selectedRecords)
        .then(() => {
            console.log('Refresh apex is called');
            refreshApex(this.wiredaccounts);
            console.log('Refresh apex is called');
        })
        .catch(error => {
           console.log('error is ',JSON.stringify(error.message))
        });
    }
}