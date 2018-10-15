import { Component } from '@angular/core';

import { CONTENT } from './content.constant';

@Component({
  selector: 'angular',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  pages = () => {
    return Object.keys(CONTENT);
  }

  content(page) {
    return CONTENT[page];
  }

  handleScroll($event) {
    console.log($event)
  }
}
