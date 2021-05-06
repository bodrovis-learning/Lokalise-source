import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  tasksCount = 201
  genderCode = 3

  today: number = Date.now()

  company = "Lokalise"
  created_by = $localize`Created by ${this.company}`

  male() { this.genderCode = 0; }
  female() { this.genderCode = 1; }
  other() { this.genderCode = 2; }

}
