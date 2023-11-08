import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  public username : string= ""
  public password : string= ""

  constructor(private router: Router) { }
    
  ngOnInit() {
  
  }

  public onClickLogin(){
    console.log("onClickLogin==", this.username,"===", this.password)
    if(this.validated()){
      this.router.navigate(['/dashbaord'])
        .then(nav => {
          console.log(nav); 
        }, err => {
          console.log(err)
        });
    }
  }
  public validated(){
    return true
  }
}
