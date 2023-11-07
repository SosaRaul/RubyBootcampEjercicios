class Contacto

  attr_reader :nombre,:fechaNac,:email,:telefono,:direccion

  def initialize(nombre,fechaNac,email,telefono,direccion)
      @nombre = nombre
      @fechaNac = fechaNac
      @email = email
      @telefono = telefono
      @direccion = direccion
  end

end


