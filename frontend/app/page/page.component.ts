import { Component, OnInit, Input } from '@angular/core';

import { Content } from '../content';

@Component({
  selector: 'app-page',
  templateUrl: './page.component.html',
  styleUrls: ['./page.component.scss']
})
export class PageComponent implements OnInit {
  @Input() id: string;
  @Input() content: Content;

  constructor() { }

  ngOnInit() {
  }

}
