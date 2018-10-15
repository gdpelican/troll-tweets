import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { ScrollToModule } from '@nicky-lenaers/ngx-scroll-to';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AngularFontAwesomeModule } from 'angular-font-awesome';
import { ScrollEventModule } from 'ngx-scroll-event';

import { AppComponent } from './app.component';
import { ChartComponent } from './chart/chart.component';
import { LoaderComponent } from './loader/loader.component';
import { FooterComponent } from './footer/footer.component';
import { PageComponent } from './page/page.component';
import { HeaderComponent } from './header/header.component';

@NgModule({
  declarations: [
    AppComponent,
    ChartComponent,
    LoaderComponent,
    FooterComponent,
    PageComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    NgxChartsModule,
    ScrollEventModule,
    BrowserAnimationsModule,
    AngularFontAwesomeModule,
    ScrollToModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
