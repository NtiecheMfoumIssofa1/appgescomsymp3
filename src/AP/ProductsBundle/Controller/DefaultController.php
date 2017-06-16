<?php

namespace AP\ProductsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {

        $em = $this->getDoctrine()->getManager();



        $table = $em
            ->getRepository('APCaisseBundle:ticket')
            ->findBy(array('etat' => 1))
        ;


        return $this->render('APProductsBundle:Default:index.html.twig',array('table'=>ceil(count($table))));
    }
}
