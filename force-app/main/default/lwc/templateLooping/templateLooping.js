import { LightningElement } from 'lwc';

export default class TemplateLooping extends LightningElement {
    countries = ["United States", "United Kingdom", "Singapore", "Malysia"];

    contacts = [
        {
            id: 1,
            firstname: "Steve",
            lastname: "Jobs"
        }, 
        {
            id: 2,
            firstname: "Sathya",
            lastname: "Nadella"
        }
    ];
}