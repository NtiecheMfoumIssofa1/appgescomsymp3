<?php

namespace AP\CaisseBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * boncommande
 *
 * @ORM\Table(name="boncommande")
 * @ORM\Entity(repositoryClass="AP\CaisseBundle\Repository\boncommandeRepository")
 */
class boncommande
{

    /**
     * @ORM\ManyToOne(targetEntity="AP\CaisseBundle\Entity\ticket",inversedBy="boncommandes")
     * @ORM\JoinColumn(nullable=false)
     */

    private $ticket;


    /**
     * @ORM\OneToMany(targetEntity="AP\CaisseBundle\Entity\commandeprod",mappedBy="bon")
     */

    private $commandeprods;


    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var bool
     *
     * @ORM\Column(name="annule", type="boolean")
     */
    private $annule;

    public function __construct()
    {
        $this->date       = new \Datetime();
    }


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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return boncommande
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set annule
     *
     * @param boolean $annule
     *
     * @return boncommande
     */
    public function setAnnule($annule)
    {
        $this->annule = $annule;

        return $this;
    }

    /**
     * Get annule
     *
     * @return bool
     */
    public function getAnnule()
    {
        return $this->annule;
    }

    /**
     * Set ticket
     *
     * @param \AP\CaisseBundle\Entity\ticket $ticket
     *
     * @return boncommande
     */
    public function setTicket(\AP\CaisseBundle\Entity\ticket $ticket)
    {
        $this->ticket = $ticket;

        return $this;
    }

    /**
     * Get ticket
     *
     * @return \AP\CaisseBundle\Entity\ticket
     */
    public function getTicket()
    {
        return $this->ticket;
    }

    /**
     * Add commandeprod
     *
     * @param \AP\CaisseBundle\Entity\commandeprod $commandeprod
     *
     * @return boncommande
     */
    public function addCommandeprod(\AP\CaisseBundle\Entity\commandeprod $commandeprod)
    {
        $this->commandeprods[] = $commandeprod;

        return $this;
    }

    /**
     * Remove commandeprod
     *
     * @param \AP\CaisseBundle\Entity\commandeprod $commandeprod
     */
    public function removeCommandeprod(\AP\CaisseBundle\Entity\commandeprod $commandeprod)
    {
        $this->commandeprods->removeElement($commandeprod);
    }

    /**
     * Get commandeprods
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCommandeprods()
    {
        return $this->commandeprods;
    }
}
