<?php

namespace AP\CaisseBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * tables
 *
 * @ORM\Table(name="tables")
 * @ORM\Entity(repositoryClass="AP\CaisseBundle\Repository\tablesRepository")
 */
class tables
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="AP\CaisseBundle\Entity\ticket",mappedBy="tables")
     */

    private $tickets;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=10)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="lieu", type="string", length=50)
     */
    private $lieu;


    /**
     * @var bool
     *
     * @ORM\Column(name="occupe", type="boolean")
     */
    private $occupe;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return tables
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set lieu
     *
     * @param string $lieu
     *
     * @return tables
     */
    public function setLieu($lieu)
    {
        $this->lieu = $lieu;

        return $this;
    }

    /**
     * Get lieu
     *
     * @return string
     */
    public function getLieu()
    {
        return $this->lieu;
    }

   
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->tickets = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add ticket
     *
     * @param \AP\CaisseBundle\Entity\ticket $ticket
     *
     * @return tables
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
     * Set occupe
     *
     * @param boolean $occupe
     *
     * @return tables
     */
    public function setOccupe($occupe)
    {
        $this->occupe = $occupe;

        return $this;
    }

    /**
     * Get occupe
     *
     * @return boolean
     */
    public function getOccupe()
    {
        return $this->occupe;
    }
}
