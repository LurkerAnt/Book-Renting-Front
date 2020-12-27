import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
    public users: {
        username: string;
        password: string;
    }[] = [];

    constructor(
        private httpClient: HttpClient
    ) { }

    async ngOnInit(): Promise<void> {
        this.users = (await this.httpClient.get("/api/user").toPromise()) as any;
    }

}
