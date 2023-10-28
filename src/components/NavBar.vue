<template>
<nav class="navbar is-white" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="https://github.com/AxlGalicia/volcanes-api">
      <img src="./../assets/volcan.png" width="40" height="30">
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample" id="burger" @click="menuDesplegable">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <a class="navbar-item" href="https://axlgalicia.github.io/">
        Portafolio
      </a>

    </div>

    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-primary" href="https://bump.sh/axlga/doc/volcanes">
            <strong>Documentacion</strong>
          </a>
          <a class="button is-light" href="https://github.com/AxlGalicia/volcanes-api">
            Repositorio
          </a>
        </div>
      </div>
    </div>
  </div>
</nav>
</template>

<script setup>

function menuDesplegable(event) {
  const burgerIcon = document.querySelector('#burger');
  const navbarMenu = document.querySelector('#navbarBasicExample');
  burgerIcon.classList.toggle('is-active')
  navbarMenu.classList.toggle('is-active');
}

</script>

<style scoped>

</style>