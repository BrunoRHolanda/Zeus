import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {
  MatButtonModule,
  MatCheckboxModule,
  MatCardModule,
  MatGridListModule,
  MatInputModule,
  MatDividerModule,
  MatSlideToggleModule,
  MatRadioModule,
  MatToolbarModule,
  MatIconModule
} from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppComponent } from './app.component';
import { HomeComponent } from './Views/home/home.component';
import { CadastroComponent } from './Views/cadastro/cadastro.component';
import { LoginComponent } from './Views/login/login.component';
import { ContaComponent } from './Views/conta/conta.component';
import { ExtratoComponent } from './Views/extrato/extrato.component';

const appRoutes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'cadastro', component: CadastroComponent },
  { path: 'conta', component: ContaComponent },

  {
    path: '',
    redirectTo: '/home',
    pathMatch: 'full'
  },
];

@NgModule({

  declarations: [
    AppComponent,
    HomeComponent,
    CadastroComponent,
    LoginComponent,
    ContaComponent,
    ExtratoComponent,
  ],

  imports: [
    RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    BrowserModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatCheckboxModule,
    MatCardModule,
    MatGridListModule,
    MatInputModule,
    MatDividerModule,
    MatSlideToggleModule,
    MatRadioModule,
    MatToolbarModule,
    MatIconModule
  ],

  providers: [],

  bootstrap: [AppComponent]
})
export class AppModule { }
