<template>
<div class="home">
  <p>{{ $t('main.welcome', {company: 'Lokalise'}) }}</p>
  <p>{{ $tc('main.new_message', 10) }}</p>
  <p>{{ $d(new Date(), 'short') }}</p>
  <p>{{ $n(100, 'currency') }}</p>
</div>
</template>
