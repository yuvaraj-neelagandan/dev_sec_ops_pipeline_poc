import { Component } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  public username : string= ""
  public password : string= ""
  

  constructor(private router: Router, private _snackBar: MatSnackBar) { }
    
  ngOnInit() {
  
  }

  public onClickLogin(){
    if(this.validated()){
      this.router.navigate(['/dashbaord'])
        .then(nav => {
          console.log(nav); 
        }, err => {
          console.log(err)
        });
    }else{
      this.showErrorMessage()
    }
  }


  public showErrorMessage(){
    this._snackBar.open("Wrong Username/Password", "Dismiss")
  }

  public validated(){
    return (this.username.trim().length > 0 && this.password.trim().length > 0 && this.username == "admin" && this.password == "admin")
  }
}
