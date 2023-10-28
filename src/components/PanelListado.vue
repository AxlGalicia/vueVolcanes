<template>
    <div class="contenedor" id="contenedor">
        <div class="flexbox-container">
          <div class="child" v-for="item in items">
            <div class="bloque">
              <div class="bloque-imagen">
               <img :src="getUrlImage(item)">
              </div>
              <div class="bloque-informacion">
              <a style="color: white;" :href="getUrlVolcan(item)">
              <div class="informacion-nombre">
                {{ item.nombre }}
               </div></a>
               <div class="informacion-altura">
                Altura: {{ item.altura }} metros sobre nivel del mar.
               </div>
               <div class="informacion-ubicacion">
                Ubicación: {{item.ubicacion}}
               </div>
               <div class="informacion-ecosistema">
                Ecosistema: {{ item.ecosistema }}
               </div>
              </div>
            </div>
          </div>
          <div v-for="item in items_imagen">
            {{ item }}
          </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

function usuario(id,nombre,descripcion,altura,ubicacion,ecosistema,imagen){
  this.id = id;
  this.nombre = nombre;
  this.descripcion = descripcion;
  this.altura = altura;
  this.ubicacion = ubicacion;
  this.ecosistema = ecosistema;
  this.imagen = imagen;
}

function getUrlImage(item)
{
  
  return "https://api-test.lat/api/volcanes/imagen/"+item.id;
}

function getUrlVolcan(item)
{

  return "https://api-test.lat/api/volcanes/"+item.id;
}

function obtenerImagenes(){
  items.value.forEach(myFunction);
}

function myFunction(item) {
  //console.log("mi funcion");
  //console.log(item.id);
  var id = item.id.toString();
  //console.log(id);
  var url = 'https://api-test.lat/api/volcanes/imagen/'+id;
  //console.log(url);
  axios.get(url,{
    headers:{
      'Access-Control-Allow-Origin' : '*',
      'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE,PATCH,OPTIONS'
    }
  }).then(response =>{
    console.log(response.data);
    console.log(response.headers["content-type"]);
    const typeimage = response.headers["content-type"];
    const imageData = response.data;
    const imgElement = document.createElement("img");
    imgElement.src = "data:"+typeimage+";"+"base64,"+imageData;
    document.body.appendChild(imgElement);
    //console.log(response.headers.content-type);
    
    //items_imagen.value.push(response.data)
  }).catch(error=>{
    console.error(error);
  });
}

  //const items = ref([{ message: 'Foo' }, { message: 'Bar' },{ message: 'objecto1'},{ message: 'objecto2'},{ message: 'objecto3'}])
  //const items = ref(usuario[]);
  var items = ref([]);
  var items_imagen = ref([]);
  axios.get('https://api-test.lat/api/volcanes',{
      headers:{
        'Access-Control-Allow-Origin' : '*',
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE,PATCH,OPTIONS'
      },
      params:{
        Pagina: 1,
        RegistrosPorPagina: 6
      }
    }).then(response =>{
      console.log(response.data.length);
      for (var i = 0;i<response.data.length;i++)
      {
        var user = new usuario(response.data[i].id,response.data[i].nombre,response.data[i].descripcion,response.data[i].altura,response.data[i].ubicacion,response.data[i].ecosistema,response.data[i].imagen);
        items.value.push(user);
      }
      console.log(response);
      //console.log(items.value[0]);
      //obtenerImagenes();
    }).catch(error=>{
      console.error(error);
    });

//var clientWidth = document.getElementById('container').;
console.log(window.screen.width);

</script>

<style scoped>

  @media only screen and (max-width: 899px){
         .contenedor
    {
        /*background-color: #F8B802;*/
        /*background-color: #581845;*/
    
        background-color: #000000;
        padding-top: 50px;
        /*height: 400px;*/
        padding-left: 5%;
        padding-right: 5%;

    }

    .flexbox-container {
        display: flex;
        flex-wrap: wrap;

    }

    .child{
         /*width: 50%;
        padding: 10px;*/
        flex: 0 0 calc(100% - 10px);
        margin: 5px;
    }

    img{
    border-radius: 10px;
    width: 100%;
    height: 100%;
    display: block;
    }
    .bloque{
      border-radius: 10px;
      /*background-color: #FCE06D;*/
      /*background-color: #DAF7A6;*/
    
      background-color: #2f4f4f;
      display: flex;
      flex-wrap: wrap;
      /*min-height: 200px;*/
      min-height: 200px;
      margin-bottom: 10px;
    }

    .bloque-imagen{
        /*flex: 0 0 calc(40% - 10px);*/
        /*margin: 5px;*/
    }

    .bloque-informacion{
        /*flex: 0 0 calc(60% - 10px);*/
        margin: 5px;
        color: white;
    }

    .informacion-nombre{
      margin-bottom: 5px;
      font-family: Arvo;
      font-size: large;
      font-weight: bold;
      text-align: center;
    }

    .informacion-altura{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }

    .informacion-ubicacion{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }

    .informacion-ecosistema{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }
  }

   @media only screen and (max-width: 1359px) and (min-width: 900px){
       .contenedor
    {
        /*background-color: #F8B802;*/
        /*background-color: #581845;*/
        
        background-color: #000000;
        padding-top: 50px;
        /*height: 400px;*/
        padding-left: 20%;
        padding-right: 20%;

    }

    .flexbox-container {
        display: flex;
        flex-wrap: wrap;

    }

    .child{
         /*width: 50%;
        padding: 10px;*/
        flex: 0 0 calc(100% - 10px);
        margin: 5px;
    }

    img{
    border-radius: 20px;
    width: 100%;
    height: 100%;
    display: block;
    }
    .bloque{
      border-radius: 20px;
      /*background-color: #FCE06D;*/
      /*background-color: #DAF7A6;*/
    
      background-color: #2f4f4f;
      display: flex;
      flex-wrap: wrap;
      /*min-height: 200px;*/
      min-height: 200px;
      margin-bottom: 10px;
    }

    .bloque-imagen{
        flex: 0 0 calc(40% - 10px);
        /*margin: 5px;*/
    }

    .bloque-informacion{
        flex: 0 0 calc(60% - 10px);
        margin: 5px;
        color: white;
    }

    .informacion-nombre{
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: bold;
      text-align: center;
    }

    .informacion-altura{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }

    .informacion-ubicacion{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }

    .informacion-ecosistema{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }
   }
    
    @media only screen and (min-width: 1360px){
    .contenedor
    {
        /*background-color: #F8B802;*/
    
        /*background-color: #581845;*/
    
        background-color: #000000;
        padding-top: 50px;
        /*height: 400px;*/
        padding-left: 5%;
        padding-right: 5%;

    }

    .flexbox-container {
        display: flex;
        flex-wrap: wrap;

    }

    .child{
         /*width: 50%;
        padding: 10px;*/
        flex: 0 0 calc(50% - 10px);
        margin: 5px;
    }

    img{
    border-radius: 20px;
    width: 100%;
    height: 100%;
    display: block;
    }
    .bloque{
      border-radius: 20px;
      /*background-color: #FCE06D;*/
    
     /* background-color: #DAF7A6; */
      background-color: #2f4f4f;
      display: flex;
      flex-wrap: wrap;
      /*min-height: 200px;*/
      min-height: 200px;
      margin-bottom: 10px;
    }

    .bloque-imagen{
        flex: 0 0 calc(40% - 10px);
        /*margin: 5px;*/
    }

    .bloque-informacion{
        flex: 0 0 calc(60% - 10px);
        margin: 5px;
        color: white;
    }

    .informacion-nombre{
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: bold;
      text-align: center;
    }

    .informacion-altura{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }

    .informacion-ubicacion{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }

    .informacion-ecosistema{
      margin-left: 10px;
      margin-bottom: 5px;
      font-family: Arvo;
      font-weight: normal;
      text-align: left;
    }


    }

</style>