<?php

namespace AP\ProductsBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\UploadedFile;

/**
 * mediadoc
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="AP\ProductsBundle\Entity\thumbnailRepository")
 * @ORM\HasLifecycleCallbacks
 */
class thumbnail
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="url", type="string", length=255)
     */
    private $url;

    /**
     * @var string
     *
     * @ORM\Column(name="alt", type="string", length=255)
     */
    private $alt;

    /**
     * @Assert\File(maxSize="1M" ,
     *     mimeTypes={"image/jpeg", "image/png" , "image/jpg","image/gif"},
     *     mimeTypesMessage = "Veuillez choisir une image valide",
     *     maxSizeMessage = "la taille maximun est de 3Mb"
     * )
     */
    public $file;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

       public function getUploadDir()
    {
        return 'imgprod/';
        
    }

    protected function getUploadRootDir()
    {
        return __DIR__.'/../../../../web/'.$this->getUploadDir();
    }   
       
  
    public function upload()
    {
        if(null !== $this->file) {
          $name = $this->file->getClientOriginalName();

    $this->file->move($this->getUploadRootDir(),$name);
    unset($this->file);
    $this->url =$name;  
    $this->alt = $name;
        }
    
    
        
    }
    /**
     * Set url
     *
     * @param string $url
     *
     * @return mediadoc
     */
    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }

    /**
     * Get url
     *
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * Set alt
     *
     * @param string $alt
     *
     * @return mediadoc
     */
    public function setAlt($alt)
    {
        $this->alt = $alt;

        return $this;
    }

    /**
     * Get alt
     *
     * @return string
     */
    public function getAlt()
    {
        return $this->alt;
    }

    /**
     * Set file
     *
     * @param string $file
     *
     * @return mediadoc
     */
    public function setFile($file)
    {
        $this->file = $file;

        return $this;
    }

    /**
     * Get file
     *
     * @return string
     */
    public function getFile()
    {
        return $this->file;
    }
}
