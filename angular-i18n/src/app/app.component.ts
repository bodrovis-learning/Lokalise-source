import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  localesList = [
    { code: 'en-US', label: 'English' },
    { code: 'ru', label: 'Русский' }
  ]
  tasksCount = 201
  genderCode = 3

  today: number = Date.now()

  company = "Lokalise"
  created_by = $localize`Created by ${this.company}`

  male() { this.genderCode = 0; }
  female() { this.genderCode = 1; }
  other() { this.genderCode = 2; }
}
