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
     * @ORM\OneToMany(targetEntity="AP\CaisseBundle\Entity\ticket", mappedBy="employes")
     */
    private $tickets;



    /**
     * @var string
     *
     * @ORM\Column(name="couleur", type="string", length=8,nullable=true)
     */
    private $couleur;


    public function __construct()
   {
    parent::__construct();
    }



    /**
     * Add ticket
     *
     * @param \AP\CaisseBundle\Entity\ticket $ticket
     *
     * @return employes
     */
    public function addTicket(\AP\CaisseBundle\Entity\ticket $ticket)
    {
        $this->tickets[] = $ticket;

        return $this;
    }

    /**
     * Remove ticket
     *
     * @param \AP\CaisseBundle\Entity\ticket $ticket
     */
    public function removeTicket(\AP\CaisseBundle\Entity\ticket $ticket)
    {
        $this->tickets->removeElement($ticket);
    }

    /**
     * Get tickets
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTickets()
    {
        return $this->tickets;
    }

    /**
     * Set couleur
     *
     * @param string $couleur
     *
     * @return employes
     */
    public function setCouleur($couleur)
    {
        $this->couleur = $couleur;

        return $this;
    }

    /**
     * Get couleur
     *
     * @return string
     */
    public function getCouleur()
    {
        return $this->couleur;
    }
}
