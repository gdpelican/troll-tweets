import { Component, OnInit } from '@angular/core';

import { CONTENT } from '../content.constant';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    this.goTo(this.pages()[0]);
  }

  pages() {
    return Object.keys(CONTENT);
  }

  goTo(page:string) {
    this.active = page;
  }

}
