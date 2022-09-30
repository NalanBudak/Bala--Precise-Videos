import { LightningElement } from 'lwc';

export default class GettersInLwc extends LightningElement {
    number1 = 20;
    number2 = 10;
    fruits = ["Apple", "Orange", "Banana", "Pomogranite"];

    get firstFruit() {
        return this.fruits[0];
    }

    get sumOfNums() {
        return this.number1+this.number2;
    }
}