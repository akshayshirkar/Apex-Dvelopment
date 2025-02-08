import { LightningElement } from 'lwc';
import generateData from './generateData';
import LightningModal from 'lightning/modal';

const columns = [
    { label: 'Label', fieldName: 'name', editable: true },
    { label: 'Website', fieldName: 'website', type: 'url', editable: true },
    { label: 'Phone', fieldName: 'phone', type: 'phone', editable: true },
    { label: 'CloseAt', fieldName: 'closeAt', type: 'date', editable: true },
    { label: 'Balance', fieldName: 'amount', type: 'currency', editable: true },
];

export default class Data_Table_Demo extends LightningModal {
    data = [];
    columns = columns;
    rowOffset = 0;
    draftValues = [];

    connectedCallback() {
        this.data = generateData({ amountOfRecords: 100 });
    }
}