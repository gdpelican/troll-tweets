import { Component, OnInit, Output, EventEmitter } from '@angular/core';

import { CONTENT } from '../content.constant';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  active: string;

  @Output() onScroll: EventEmitter<string> = new EventEmitter();

  constructor() { }

  ngOnInit() {
    this.goTo(this.pages()[0]);
  }

  pages() {
    return Object.keys(CONTENT);
  }

  goTo(page:string) {
    this.active = page;
    this.onScroll.emit(this.active);
  }

}
