const express = require('express');
const router = express.Router();
const path = require('path');
const multer = require('multer');
const controlAcceso = require('../middlewares/controlAcceso');
const {check,validationResult,body} = require('express-validator');
const db = require('../database/models/');
const Article = db.Article;

//Aquí dispongo lo referido al nombre del arhivo y a donde se va a guardar
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, path.resolve(__dirname, '..','..','public','images','estadios'));
    },
    filename: function (req, file, cb) {
      cb(null, 'stadium-'+Date.now() + path.extname(file.originalname));
    }
  })
   
const upload = multer({ storage })

const adminController = require(path.resolve(__dirname,'..','controllers','adminController'));

router.get('/administrador', controlAcceso, adminController.admin);
router.get('/administrador/search_results', controlAcceso, adminController.search);
router.get('/administrador/create', controlAcceso, adminController.create);

Article.findAll()
  .then((article) =>{
    router.post("/administrador/create", upload.single('imagen'), [

      body('imagen').custom((value, {req}) =>{
        if(req.file != undefined){
          return true
        }
        return false;
      }).withMessage('Debe elegir la imagen del producto en formato .JPG ó .JPEG ó .PNG'),
      check('equipo').isLength({
        min: 3
      }).withMessage('El nombre del equipo es obligatorio'),
      check('estadio').isLength({
        min: 3
      }).withMessage('El nombre del estadio es obligatorio'),
      check('precio').isLength({
        min: 1
      }).withMessage('El precio es obligatorio'), 
      check('descripcion').isLength({
        min: 3
      }).withMessage('La descripción del producto es obligatoria'), 
      
    ],adminController.save);
  })



router.get('/administrador/detalleAdmin/:id', controlAcceso, adminController.show);
router.get('/administrador/edit/:id', controlAcceso, adminController.edit);

Article.findAll()
  .then((articles) =>{
    router.put('/administrador/edit/:id', upload.single('imagen'), [
      check('equipo').isLength({
        min: 3
      }).withMessage('El nombre del equipo es obligatorio'),
      check('estadio').isLength({
        min: 3
      }).withMessage('El nombre del estadio es obligatorio'),
      check('precio').isLength({
        min: 1
      }).withMessage('El precio es obligatorio'), 
      check('descripcion').isLength({
        min: 3
      }).withMessage('La descripción del producto es obligatoria'),

    ], adminController.update);
  })





router.get('/administrador/delete/:id', controlAcceso, adminController.destroy);
router.get('/administrador/search_results', controlAcceso, adminController.search);

module.exports = router;