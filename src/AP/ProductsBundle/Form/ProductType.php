<?php

namespace AP\ProductsBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Doctrine\ORM\EntityRepository;

class ProductType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('code')
            ->add('designation')
            ->add('prixvente')
            ->add('prixachat')
            ->add('qtestock')
            ->add('qtemin')
            ->add('gerstock')
            ->add('typeproduit',ChoiceType::class,array('choices'=> array(''=>'',
            'Entier non divisible'=>'1',
            'Entier divisible en part'=>'2',
            'part de produit'=>'3',

        ),
            'label' => 'Type de produit'
            ))
            ->add('qtepart')
            ->add('nbrediv',ChoiceType::class,array('choices'=> array(''=>'',
                'Conso'=>'1',
                'demi bouteille'=>'2',

            ),
                'label' => 'Conso ou bouteille ?'
                ,
                'required' => false
            ))
            ->add('prodparent',EntityType::class,array(
                'class' => 'APProductsBundle:Product',
                'query_builder' => function(EntityRepository $er) {
                    return $er->createQueryBuilder('c')
                        ->where('c.typeproduit = :type')
                        ->setParameter('type', '2')
                        ->orderBy('c.designation', 'ASC');
                },
                'empty_data'  => null,
                'required' => false

            )   )



            ->add('category');
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AP\ProductsBundle\Entity\Product'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'ap_productsbundle_product';
    }


}
