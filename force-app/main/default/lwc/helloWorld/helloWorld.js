import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    name; //undefined
    fullname = 'Salesforce LWC';
    detail = {
        name: "Sathvik",
        age: 24,
        place: "Houston, United States"
    };
    year = 2022;
    colors = ["red", "blue", "green"];
}