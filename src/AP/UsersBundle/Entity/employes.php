<?php

namespace AP\UsersBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * employes
 *
 * @ORM\Table(name="employes")
 * @ORM\Entity(repositoryClass="AP\UsersBundle\Repository\employesRepository")
 */
class employes extends BaseUser
{
    /**
     * @var int
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;


    /**
     * Get id
     *
     * @return int
     */


    public function __construct()
   {
    parent::__construct();
    }


}

