<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function login(Request $request)
    {
      $data = $request->all();


      $valiacao = Validator::make($data, [
          'email' => 'required|string|email|max:255',
          'password' => 'required|string',
      ]);

      if($valiacao->fails()){
        return ['status'=>false,"validacao"=>true,"erros"=>$valiacao->errors()];
      }

      if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password']])){
        $user = auth()->user();
        $user->token = $user->createToken($user->email)->accessToken;
        $user->image = asset($user->image);
        return ['status'=>true,"usuario"=>$user];
      }else{
        return ['status'=>false];
      }
    }

    public function register(Request $request)
    {
      $data = $request->all();

      $validacao = Validator::make($data, [
          'name' => 'required|string|max:255',
          'email' => 'required|string|email|max:255|unique:users',
          'password' => 'required|string|min:6|confirmed',
      ]);

      if($validacao->fails()){
        return $validacao->errors();
      }
      $image = "/profiles/default.jpg";

      $user = User::create([
          'name' => $data['name'],
          'email' => $data['email'],
          'password' => bcrypt($data['password']),
          'image'=> $image
      ]);
      $user->token = $user->createToken($user->email)->accessToken;
      $user->image = asset($user->image);

      return $user;
    }

    public function profile(Request $request)
    {
      $user = $request->user();
      $data = $request->all();

      if(isset($data['password'])){
        $valiacao = Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => ['required','string','email','max:255',Rule::unique('users')->ignore($user->id)],
            'password' => 'required|string|min:6|confirmed',
        ]);
        if($valiacao->fails()){
          return ['status'=>false,"validacao"=>true,"erros"=>$valiacao->errors()];
        }
        $user->password = bcrypt($data['password']);

      }else{
        $valiacao = Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => ['required','string','email','max:255',Rule::unique('users')->ignore($user->id)],
        ]);

        if($valiacao->fails()){
          return ['status'=>false,"validacao"=>true,"erros"=>$valiacao->errors()];
        }
        $user->name = $data['name'];
        $user->email = $data['email'];
      }

      if(isset($data['image'])){

        Validator::extend('base64image', function ($attribute, $value, $parameters, $validator) {
              $explode = explode(',', $value);
              $allow = ['png', 'jpg', 'svg','jpeg'];
              $format = str_replace(
                  [
                      'data:image/',
                      ';',
                      'base64',
                  ],
                  [
                      '', '', '',
                  ],
                  $explode[0]
              );
              // check file format
              if (!in_array($format, $allow)) {
                  return false;
              }
              // check base64 format
              if (!preg_match('%^[a-zA-Z0-9/+]*={0,2}$%', $explode[1])) {
                  return false;
              }
              return true;
          });

          $valiacao = Validator::make($data, [
              'image' => 'base64image',

          ],['base64image'=>'Imagem inválida']);

          if($valiacao->fails()){
            return ['status'=>false,"validacao"=>true,"erros"=>$valiacao->errors()];
          }
        $time = time();
        $diretorioPai = 'profiles';
        $diretorioImagem = $diretorioPai.DIRECTORY_SEPARATOR.'perfil_id'.$user->id;
        $ext = substr($data['image'], 11, strpos($data['image'], ';') - 11);
        $urlImagem = $diretorioImagem.DIRECTORY_SEPARATOR.$time.'.'.$ext;

        $file = str_replace('data:image/'.$ext.';base64,','',$data['image']);
        $file = base64_decode($file);

        if(!file_exists($diretorioPai)){
          mkdir($diretorioPai,0700);
        }
        if($user->image){
          if(file_exists($user->image)){
            unlink($user->image);
          }
        }
        if(!file_exists($diretorioImagem)){
          mkdir($diretorioImagem,0700);
        }
        file_put_contents($urlImagem,$file);
        $user->image = $urlImagem;

      }
      $user->save();

      $user->imagem = asset($user->image);
      $user->token = $user->createToken($user->email)->accessToken;
      return ['status'=>true,"usuario"=>$user];
    }
}
