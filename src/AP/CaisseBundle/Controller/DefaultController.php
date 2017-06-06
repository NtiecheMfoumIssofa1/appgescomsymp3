<?php

namespace AP\CaisseBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('APCaisseBundle:Default:index.html.twig');
    }


    public function tableAction()
    {


        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');
        $category = $em->getRepository('APProductsBundle:Category');

        $prod = $produit->findAll();
        $cat = $category->findAll();

        return $this->render('APCaisseBundle:Default:table.html.twig',array('produits'=>$prod,'categories'=>$cat));
    }



    public function prodcaisseAction(Request $request,$id)
    {

        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');

        $query = $produit->createQueryBuilder('a')
            ->where('a.designation LIKE :title')
            ->setParameter('title', '%'.$id.'%')
            ->getQuery()
            ->getResult();



        $output = '<ul class="list-group" id="stock_products_ul" >';
        foreach ($query as $ad) {
            $output .= '<li class="list-group-item" id="'. $ad->getPrixvente() . '">' . $ad->getDesignation() . '</li>';
        }
        $output .= '</ul>';




        return new Response($output);

    }






}
