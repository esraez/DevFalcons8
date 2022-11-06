import { LightningElement } from 'lwc';

export default class ContactsLooping extends LightningElement {
    contacts = [
        {FirstName: "Bala", LastName: "Test"},
        {FirstName: "Jay", LastName : "Jack"},
        {FirstName: "Ben", LastName: "Test"}
      ];
}