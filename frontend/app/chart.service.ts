import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export const ChartEndpoints = {
  hourly:  'summary/published/hourly',
  daily:   'summary/published/daily',
  monthly: 'summary/published/monthly',
  yearly:  'summary/published/yearly'
}

export interface Chart {
  data: Array<object>,
  label_x: string,
  label_y: string,
  colors: object
}

@Injectable({ providedIn: 'root' })
export class ChartService {

  constructor(private http: HttpClient) {}

  fetch(name: string): Observable<Chart> {
    if (!ChartEndpoints[name]) {
      console.warn(`Invalid chart name requested: ${name}`)
      return Observable.create(() => {
        return { type: 'none', data: [] }
      })
    }

    return this.http.get<Chart>(`api/${ChartEndpoints[name]}`)
  }
}
