import { Component, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';

import { CONTENT } from './content.constant';

@Component({
  selector: 'angular',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  public offset: string = '0px';
  public config: PerfectScrollbarConfigInterface = {};

  constructor(@Inject(DOCUMENT) private document: any) {}

  pages = () => {
    return Object.keys(CONTENT);
  }

  content(page) {
    return CONTENT[page];
  }

  onSelect(id) {
    let page = this.document.getElementById(id);
    if (page) {
      this.offset = `-${page.offsetLeft}px`;
      this.height = `${page.offsetHeight}px`;
    }
  }
}
