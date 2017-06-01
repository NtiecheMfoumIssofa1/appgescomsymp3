<?php

namespace AP\ProductsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('APProductsBundle:Default:index.html.twig');
    }
}
