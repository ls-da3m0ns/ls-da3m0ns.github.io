<!doctype html>
<!--
  Minimal Mistakes Jekyll Theme 4.21.0 by Michael Rose
  Copyright 2013-2020 Michael Rose - mademistakes.com | @mmistakes
  Free for personal and commercial use under the MIT license
  https://github.com/mmistakes/minimal-mistakes/blob/master/LICENSE
-->
<html lang="en" class="no-js">
  <head>
    <meta charset="utf-8">

<!-- begin _includes/seo.html --><title>            Solar Radiation Prediction | Beginers Tech      the Ultimate Techy !      </title>
<meta name="description" content="EDA on solar Radiation Dataset with basic modeling leading to below 18 RMSE on testing set">


  <meta name="author" content="Prashant Singh">
  
  <meta property="article:author" content="Prashant Singh">
  


<meta property="og:type" content="article">
<meta property="og:locale" content="en_US">
<meta property="og:site_name" content="Beginers Tech | the Ultimate Techy !">
<meta property="og:title" content="Solar Radiation Prediction">
<meta property="og:url" content="http://localhost:4000/linux/ml/solar-radiatio-prediction">


  <meta property="og:description" content="EDA on solar Radiation Dataset with basic modeling leading to below 18 RMSE on testing set">



  <meta property="og:image" content="http://localhost:4000/assets/images/posts/blog_13/image_1.png">



  <meta name="twitter:site" content="@ls_da3mons">
  <meta name="twitter:title" content="Solar Radiation Prediction">
  <meta name="twitter:description" content="EDA on solar Radiation Dataset with basic modeling leading to below 18 RMSE on testing set">
  <meta name="twitter:url" content="http://localhost:4000/linux/ml/solar-radiatio-prediction">

  
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:image" content="http://localhost:4000/assets/images/posts/blog_13/image_1.png">
  

  



  <meta property="article:published_time" content="2020-12-19T00:00:00+05:30">





  

  


<link rel="canonical" href="http://localhost:4000/linux/ml/solar-radiatio-prediction">




<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    
      "@type": "Person",
      "name": "Prashant Singh",
      "url": "http://localhost:4000/"
    
  }
</script>


  <meta name="google-site-verification" content="google-site-verification=u1WudUCX5MxBBYu26WTtlI7brgH_nOPBxyRyGz5sVis" />





<!-- end _includes/seo.html -->


<link href="/feed.xml" type="application/atom+xml" rel="alternate" title="Beginers Tech | the Ultimate Techy ! Feed">

<!-- https://t.co/dKP3o1e -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script>
  document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/g, '') + ' js ';
</script>

<!-- For all browsers -->
<link rel="stylesheet" href="/assets/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5/css/all.min.css">

<!--[if IE]>
  <style>
    /* old IE unsupported flexbox fixes */
    .greedy-nav .site-title {
      padding-right: 3em;
    }
    .greedy-nav button {
      position: absolute;
      top: 0;
      right: 0;
      height: 100%;
    }
  </style>
<![endif]-->



    <!-- start custom head snippets -->

<!-- insert favicons. use https://realfavicongenerator.net/ -->


<link rel="apple-touch-icon" sizes="180x180" href="assets/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">
<link rel="manifest" href="assets/images/site.webmanifest">
<link rel="mask-icon" href="assets/images/safari-pinned-tab.svg" color="#5bbad5">
<link rel="shortcut icon" href="assets/images/favicon.ico">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="msapplication-config" content="assets/images/browserconfig.xml">
<meta name="theme-color" content="#ffffff">


<!-- end custom head snippets -->
<!-- Begin Jekyll SEO tag v2.7.1 -->
<title>Solar Radiation Prediction | Beginers Tech the Ultimate Techy !</title>
<meta name="generator" content="Jekyll v4.1.1" />
<meta property="og:title" content="Solar Radiation Prediction" />
<meta name="author" content="Prashant Singh" />
<meta property="og:locale" content="en_US" />
<meta name="description" content="EDA on solar Radiation Dataset with basic modeling leading to below 18 RMSE on testing set" />
<meta property="og:description" content="EDA on solar Radiation Dataset with basic modeling leading to below 18 RMSE on testing set" />
<link rel="canonical" href="http://localhost:4000/linux/ml/solar-radiatio-prediction" />
<meta property="og:url" content="http://localhost:4000/linux/ml/solar-radiatio-prediction" />
<meta property="og:site_name" content="Beginers Tech the Ultimate Techy !" />
<meta property="og:type" content="article" />
<meta property="article:published_time" content="2020-12-19T00:00:00+05:30" />
<meta name="twitter:card" content="summary" />
<meta property="twitter:title" content="Solar Radiation Prediction" />
<meta name="twitter:site" content="@ls_da3mons" />
<meta name="twitter:creator" content="@Prashant Singh" />
<meta name="google-site-verification" content="google-site-verification=u1WudUCX5MxBBYu26WTtlI7brgH_nOPBxyRyGz5sVis" />
<script type="application/ld+json">
{"headline":"Solar Radiation Prediction","dateModified":"2020-12-19T00:00:00+05:30","datePublished":"2020-12-19T00:00:00+05:30","@type":"BlogPosting","mainEntityOfPage":{"@type":"WebPage","@id":"http://localhost:4000/linux/ml/solar-radiatio-prediction"},"publisher":{"@type":"Organization","logo":{"@type":"ImageObject","url":"http://localhost:4000/assets/images/cli_logo.png"},"name":"Prashant Singh"},"url":"http://localhost:4000/linux/ml/solar-radiatio-prediction","author":{"@type":"Person","name":"Prashant Singh"},"description":"EDA on solar Radiation Dataset with basic modeling leading to below 18 RMSE on testing set","@context":"https://schema.org"}</script>
<!-- End Jekyll SEO tag -->

    <!-- Global site tag (gtag.js) - Google Analytics -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-3WQQLGB76V"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-3WQQLGB76V');
</script>

  </head>

  <body class="layout--single wide">
    <nav class="skip-links">
  <h2 class="screen-reader-text">Skip links</h2>
  <ul>
    <li><a href="#site-nav" class="screen-reader-shortcut">Skip to primary navigation</a></li>
    <li><a href="#main" class="screen-reader-shortcut">Skip to content</a></li>
    <li><a href="#footer" class="screen-reader-shortcut">Skip to footer</a></li>
  </ul>
</nav>

    <!--[if lt IE 9]>
<div class="notice--danger align-center" style="margin: 0;">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience.</div>
<![endif]-->

    

<div class="masthead">
  <div class="masthead__inner-wrap">
    <div class="masthead__menu">
      <nav id="site-nav" class="greedy-nav">
        
          <a class="site-logo" href="/"><img src="/assets/images/cli_logo.png" alt=""></a>
        
        <a class="site-title" href="/">
          Beginers Tech | the Ultimate Techy !
          <span class="site-subtitle">Version 1.0</span>
        </a>
        <ul class="visible-links"><li class="masthead__menu-item">
              <a href="https://drive.google.com/file/d/1EMp7ihqtNIjf7_u01Spa9e9m02TtAsuZ/view?usp=sharing">Resume/CV</a>
            </li><li class="masthead__menu-item">
              <a href="/Blogs/">Blogs</a>
            </li><li class="masthead__menu-item">
              <a href="/Pages">Projects / Pages</a>
            </li><li class="masthead__menu-item">
              <a href="/categories/">Blog Categories</a>
            </li></ul>
        
        <button class="search__toggle" type="button">
          <span class="visually-hidden">Toggle search</span>
          <svg class="icon" width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15.99 16">
            <path d="M15.5,13.12L13.19,10.8a1.69,1.69,0,0,0-1.28-.55l-0.06-.06A6.5,6.5,0,0,0,5.77,0,6.5,6.5,0,0,0,2.46,11.59a6.47,6.47,0,0,0,7.74.26l0.05,0.05a1.65,1.65,0,0,0,.5,1.24l2.38,2.38A1.68,1.68,0,0,0,15.5,13.12ZM6.4,2A4.41,4.41,0,1,1,2,6.4,4.43,4.43,0,0,1,6.4,2Z" transform="translate(-.01)"></path>
          </svg>
        </button>
        
        <button class="greedy-nav__toggle hidden" type="button">
          <span class="visually-hidden">Toggle menu</span>
          <div class="navicon"></div>
        </button>
        <ul class="hidden-links hidden"></ul>
      </nav>
    </div>
  </div>
</div>


    <div class="initial-content">
      
  







<div class="page__hero--overlay"
  style=" background-image: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url('/assets/images/posts/blog_13/image_1.png');"
>
  
    <div class="wrapper">
      <h1 id="page-title" class="page__title" itemprop="headline">
        
          Solar Radiation Prediction

        
      </h1>
      
        <p class="page__lead">This is my approach to Solar Radiation Prediction Challenge hosted on Dockship, My main focus was on EDA part rather than modeling but still a very basic approach got me below 18 RMSE on testing data that’s pretty awesome.
</p>
      
      

  <p class="page__meta">
    
      
      <span class="page__meta-date">
        <i class="far fa-calendar-alt" aria-hidden="true"></i>
        <time datetime="2020-12-19T00:00:00+05:30">December 19, 2020</time>
      </span>
    

    <span class="page__meta-sep"></span>

    
      
      

      <span class="page__meta-readtime">
        <i class="far fa-clock" aria-hidden="true"></i>
        
          less than 1 minute read
        
      </span>
    
  </p>


      
      
    </div>
  
  
    <span class="page__hero-caption">
</span>
  
</div>





<div id="main" role="main">
  
  <div class="sidebar sticky">
  


<div itemscope itemtype="https://schema.org/Person">

  
    <div class="author__avatar">
      
        <img src="/assets/images/prashant_singh_transparent.png" alt="Prashant Singh" itemprop="image">
      
    </div>
  

  <div class="author__content">
    
      <h3 class="author__name" itemprop="name">Prashant Singh</h3>
    
    
      <div class="author__bio" itemprop="description">
        <p>Feeling Useless?  Imagine having a blog with awesome Content and still no views</p>

      </div>
    
  </div>

  <div class="author__urls-wrapper">
    <button class="btn btn--inverse">Follow</button>
    <ul class="author__urls social-icons">
      
        <li itemprop="homeLocation" itemscope itemtype="https://schema.org/Place">
          <i class="fas fa-fw fa-map-marker-alt" aria-hidden="true"></i> <span itemprop="name">localhost</span>
        </li>
      

      
        
          
            <li><a href="https://github.com/ls-da3m0ns" rel="nofollow noopener noreferrer"><i class="fab fa-fw fa-github" aria-hidden="true"></i><span class="label">GitHub</span></a></li>
          
        
          
            <li><a href="https://beginers.tech" rel="nofollow noopener noreferrer"><i class="fas fa-fw fa-link" aria-hidden="true"></i><span class="label">Website</span></a></li>
          
        
          
            <li><a href="https://twitter.com/ls_da3m0ns" rel="nofollow noopener noreferrer"><i class="fab fa-fw fa-twitter-square" aria-hidden="true"></i><span class="label">Twitter</span></a></li>
          
        
          
            <li><a href="mailto:mail.prashantsingh.41@gmail.com" rel="nofollow noopener noreferrer"><i class="fas fa-fw fa-envelope-square" aria-hidden="true"></i><span class="label">Email</span></a></li>
          
        
      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      

      <!--
  <li>
    <a href="http://link-to-whatever-social-network.com/user/" itemprop="sameAs" rel="nofollow noopener noreferrer">
      <i class="fas fa-fw" aria-hidden="true"></i> Custom Social Profile Link
    </a>
  </li>
-->
    </ul>
  </div>
</div>

  
  </div>



  <article class="page" itemscope itemtype="https://schema.org/CreativeWork">
    <meta itemprop="headline" content="Solar Radiation Prediction">
    <meta itemprop="description" content="This is my approach to Solar Radiation Prediction Challenge hosted on Dockship, My main focus was on EDA part rather than modeling but still a very basic approach got me below 18 RMSE on testing data that’s pretty awesome.">
    <meta itemprop="datePublished" content="2020-12-19T00:00:00+05:30">
    

    <div class="page__inner-wrap">
      

      <section class="page__content" itemprop="text">
        
        This is my approach to Solar Radiation Prediction Challenge hosted on Dockship, My main focus was on EDA part rather than modeling but still a very basic approach got me below 18 RMSE on testing data that's pretty awesome.


<script src="https://gist.github.com/eb3b23c5f9dc34962b0724ee6bd81808.js"> </script>
        
      </section>

      <footer class="page__meta">
        
        


  


  
  
  

  <p class="page__taxonomy">
    <strong><i class="fas fa-fw fa-folder-open" aria-hidden="true"></i> Categories: </strong>
    <span itemprop="keywords">
    
      
      
      <a href="/categories/#linux" class="page__taxonomy-item" rel="tag">linux</a><span class="sep">, </span>
    
      
      
      <a href="/categories/#ml" class="page__taxonomy-item" rel="tag">ML</a>
    
    </span>
  </p>


        
  <p class="page__date"><strong><i class="fas fa-fw fa-calendar-alt" aria-hidden="true"></i> Updated:</strong> <time datetime="2020-12-19T00:00:00+05:30">December 19, 2020</time></p>


      </footer>

      <section class="page__share">
  
    <h4 class="page__share-title">Share on</h4>
  

  <a href="https://twitter.com/intent/tweet?via=%40ls_da3mons&text=Solar+Radiation+Prediction%20http%3A%2F%2Flocalhost%3A4000%2Flinux%2Fml%2Fsolar-radiatio-prediction" class="btn btn--twitter" onclick="window.open(this.href, 'window', 'left=20,top=20,width=500,height=500,toolbar=1,resizable=0'); return false;" title="Share on Twitter"><i class="fab fa-fw fa-twitter" aria-hidden="true"></i><span> Twitter</span></a>

  <a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A4000%2Flinux%2Fml%2Fsolar-radiatio-prediction" class="btn btn--facebook" onclick="window.open(this.href, 'window', 'left=20,top=20,width=500,height=500,toolbar=1,resizable=0'); return false;" title="Share on Facebook"><i class="fab fa-fw fa-facebook" aria-hidden="true"></i><span> Facebook</span></a>

  <a href="https://www.linkedin.com/shareArticle?mini=true&url=http%3A%2F%2Flocalhost%3A4000%2Flinux%2Fml%2Fsolar-radiatio-prediction" class="btn btn--linkedin" onclick="window.open(this.href, 'window', 'left=20,top=20,width=500,height=500,toolbar=1,resizable=0'); return false;" title="Share on LinkedIn"><i class="fab fa-fw fa-linkedin" aria-hidden="true"></i><span> LinkedIn</span></a>
</section>


      
  <nav class="pagination">
    
      <a href="/linux/ml/fake-news-detector" class="pagination--pager" title="100% accuracy on Fake News Classifiaction problem
">Previous</a>
    
    
      <a href="/linux/kubernetes-introduction" class="pagination--pager" title="Kubernetes Introduction
">Next</a>
    
  </nav>

    </div>

    
  </article>

  
  
    <div class="page__related">
      <h4 class="page__related-title">You may also enjoy</h4>
      <div class="grid__wrapper">
        
          



<div class="grid__item">
  <article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">
    
      <div class="archive__item-teaser">
        <img src="/assets/images/default_overlay.png" alt="">
      </div>
    
    <h2 class="archive__item-title no_toc" itemprop="headline">
      
        <a href="/linux/ml/Tensorflow_TPU_and_Tfrecords" rel="permalink">Tensorflow TPU and TFrecords
</a>
      
    </h2>
    

  <p class="page__meta">
    
      
      <span class="page__meta-date">
        <i class="far fa-fw fa-calendar-alt" aria-hidden="true"></i>
        <time datetime="2021-01-27T00:00:00+05:30">January 27, 2021</time>
      </span>
    

    <span class="page__meta-sep"></span>

    
      
      

      <span class="page__meta-readtime">
        <i class="far fa-fw fa-clock" aria-hidden="true"></i>
        
          10 minute read
        
      </span>
    
  </p>


    <p class="archive__item-excerpt" itemprop="description">Before I start let me first say this “TPUs are fast and with fast i mean crazy fast the biggest bottleneck for TPU is its data loading process”
</p>
  </article>
</div>

        
          



<div class="grid__item">
  <article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">
    
      <div class="archive__item-teaser">
        <img src="/assets/images/default_overlay.png" alt="">
      </div>
    
    <h2 class="archive__item-title no_toc" itemprop="headline">
      
        <a href="/linux/kubernetes-introduction" rel="permalink">Kubernetes Introduction
</a>
      
    </h2>
    

  <p class="page__meta">
    
      
      <span class="page__meta-date">
        <i class="far fa-fw fa-calendar-alt" aria-hidden="true"></i>
        <time datetime="2021-01-14T00:00:00+05:30">January 14, 2021</time>
      </span>
    

    <span class="page__meta-sep"></span>

    
      
      

      <span class="page__meta-readtime">
        <i class="far fa-fw fa-clock" aria-hidden="true"></i>
        
          3 minute read
        
      </span>
    
  </p>


    <p class="archive__item-excerpt" itemprop="description">With this article I am starting a new series of blog about kubernetes I will be going in detail about kubernetes and will also deploy lots of projects and de...</p>
  </article>
</div>

        
          



<div class="grid__item">
  <article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">
    
      <div class="archive__item-teaser">
        <img src="/assets/images/default_overlay.png" alt="">
      </div>
    
    <h2 class="archive__item-title no_toc" itemprop="headline">
      
        <a href="/linux/ml/fake-news-detector" rel="permalink">100% accuracy on Fake News Classifiaction problem
</a>
      
    </h2>
    

  <p class="page__meta">
    
      
      <span class="page__meta-date">
        <i class="far fa-fw fa-calendar-alt" aria-hidden="true"></i>
        <time datetime="2020-12-18T00:00:00+05:30">December 18, 2020</time>
      </span>
    

    <span class="page__meta-sep"></span>

    
      
      

      <span class="page__meta-readtime">
        <i class="far fa-fw fa-clock" aria-hidden="true"></i>
        
          less than 1 minute read
        
      </span>
    
  </p>


    <p class="archive__item-excerpt" itemprop="description">This is my approach to fake news classification challenge, If You ask me this was prettyu basic competion the trick was one of the test case ehich had no con...</p>
  </article>
</div>

        
          



<div class="grid__item">
  <article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">
    
      <div class="archive__item-teaser">
        <img src="/assets/images/default_overlay.png" alt="">
      </div>
    
    <h2 class="archive__item-title no_toc" itemprop="headline">
      
        <a href="/linux/ml/traffic_volume_prediction" rel="permalink">Top 0.1% EDA for metro-interstate-traffic-volume
</a>
      
    </h2>
    

  <p class="page__meta">
    
      
      <span class="page__meta-date">
        <i class="far fa-fw fa-calendar-alt" aria-hidden="true"></i>
        <time datetime="2020-12-18T00:00:00+05:30">December 18, 2020</time>
      </span>
    

    <span class="page__meta-sep"></span>

    
      
      

      <span class="page__meta-readtime">
        <i class="far fa-fw fa-clock" aria-hidden="true"></i>
        
          less than 1 minute read
        
      </span>
    
  </p>


    <p class="archive__item-excerpt" itemprop="description">This is my approach to metro-interstate-traffic-volume major feature of this EDA is its Data Cleaning step while Modeling Step was pretty Straight forward an...</p>
  </article>
</div>

        
      </div>
    </div>
  
  
</div>

    </div>

    
      <div class="search-content">
        <div class="search-content__inner-wrap"><form class="search-content__form" onkeydown="return event.key != 'Enter';">
    <label class="sr-only" for="search">
      Enter your search term...
    </label>
    <input type="search" id="search" class="search-input" tabindex="-1" placeholder="Enter your search term..." />
  </form>
  <div id="results" class="results"></div></div>

      </div>
    

    <div id="footer" class="page__footer">
      <footer>
        <!-- start custom footer snippets -->

<!-- end custom footer snippets -->
        <div class="page__footer-follow">
  <ul class="social-icons">
    
      <li><strong></strong></li>
    

    
      
        
          <li><a href="mailto:mail.prashantsingh.41@gmail.com" rel="nofollow noopener noreferrer"><i class="fas fa-fw fa-envelope-square" aria-hidden="true"></i> Email</a></li>
        
      
        
          <li><a href="https://beginers.tech" rel="nofollow noopener noreferrer"><i class="fas fa-fw fa-link" aria-hidden="true"></i> Website</a></li>
        
      
        
          <li><a href="https://twitter.com/ls_da3m0ns" rel="nofollow noopener noreferrer"><i class="fab fa-fw fa-twitter-square" aria-hidden="true"></i> Twitter</a></li>
        
      
        
          <li><a href="https://github.com/ls-da3m0ns" rel="nofollow noopener noreferrer"><i class="fab fa-fw fa-github" aria-hidden="true"></i> GitHub</a></li>
        
      
    

    <li><a href="/feed.xml"><i class="fas fa-fw fa-rss-square" aria-hidden="true"></i> Feed</a></li>
  </ul>
</div>

<!--<div class="page__footer-copyright">&copy; 2021 Prashant Singh. Supported by <a href="https://jekyllrb.com" rel="nofollow">Jekyll</a> &amp; <a href="https://mademistakes.com/work/minimal-mistakes-jekyll-theme/" rel="nofollow">Minimal Mistakes</a>.</div>
--->
      </footer>
    </div>

    
  <script src="/assets/js/main.min.js"></script>




<script src="/assets/js/lunr/lunr.min.js"></script>
<script src="/assets/js/lunr/lunr-store.js"></script>
<script src="/assets/js/lunr/lunr-en.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-3WQQLGB76V"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-3WQQLGB76V');
</script>



    <script>
  'use strict';

  (function() {
    var commentContainer = document.querySelector('#utterances-comments');

    if (!commentContainer) {
      return;
    }

    var script = document.createElement('script');
    script.setAttribute('src', 'https://utteranc.es/client.js');
    script.setAttribute('repo', 'ls-da3m0ns/ls-da3m0ns.github.io');
    script.setAttribute('issue-term', 'pathname');
    script.setAttribute('theme', 'github-light');
    script.setAttribute('crossorigin', 'anonymous');

    commentContainer.appendChild(script);
  })();
</script>

  





  </body>
</html>
