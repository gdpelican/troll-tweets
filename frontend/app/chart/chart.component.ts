import { Component, OnInit, Input } from '@angular/core';

import { ChartService, Chart } from '../chart.service';

@Component({
  selector: 'app-chart',
  templateUrl: './chart.component.html',
  styleUrls: ['./chart.component.css']
})
export class ChartComponent implements OnInit {
  @Input() name: string;
  private chart: Chart;

  constructor(private chartService: ChartService) { }

  ngOnInit() {
    this.chartService.fetch(this.name).subscribe((chart: Chart) => {
      this.chart = chart
      console.log(chart)
    })
  }

}
