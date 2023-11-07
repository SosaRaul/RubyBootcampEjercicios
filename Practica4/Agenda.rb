require 'csv'
class Agenda

  def initialize()
    begin
      CSV.read('agenda.csv',headers:true)
    rescue Errno::ENOENT
        CSV.open('agenda.csv','w') do |csvNuevo|
          csvNuevo.add_row(['nombre','fechaNac','email','telefono','direccion'])
        end
    end
  end

  def mostrarContactos()
    contactos = CSV.read("agenda.csv",headers:true)
    contactos.each do |contacto|
      puts "\nNombre : #{contacto['nombre']} \nFecha Nacimiento : #{contacto['fechaNac']}"
      puts "Email : #{contacto['email']} \nTelefono : #{contacto['telefono']} \nDireccion : #{contacto['direccion']}"
    end
  end

  def agregarContacto(nombre,fechaNac,email,telefono,direccion)
    contactos =  CSV.read('agenda.csv',headers: true)
    nuevoContacto = Contacto.new(nombre,fechaNac,email,telefono,direccion)
    contactos << [nuevoContacto.nombre,nuevoContacto.fechaNac,nuevoContacto.email,nuevoContacto.telefono,nuevoContacto.direccion]
    actualizarCsvContactos(contactos)
  end

  def editarContacto(nombre)
    contactos =  CSV.read('agenda.csv',headers: true)
    contactoBuscado = buscarContacto(nombre)

    if(contactoBuscado)
      indiceContactoBuscado = contactos.find_index(contactoBuscado)
      menuEditarContacto(contactoBuscado)
      contactos[indiceContactoBuscado] = contactoBuscado
      actualizarCsvContactos(contactos)
    else
      puts "CONTACTO NO ENCONTRADO"
    end

  end

  def buscarContacto(nombre)
    contactos =  CSV.read('agenda.csv',headers: true)
    contactoBuscado = contactos.find{ |fila| fila['nombre'].downcase == nombre.downcase}
  end

  def mostrarContacto(contacto)
    puts "\nNombre : #{contacto['nombre']} \nFecha Nacimiento : #{contacto['fechaNac']}"
    puts "Email : #{contacto['email']} \nTelefono : #{contacto['telefono']} \nDireccion : #{contacto['direccion']}"
  end

  private


  def menuEditarContacto(contactoBuscado)
    puts "¿Qué quiere editar?"
    puts "1-Editar nombre\n2-Editar fechaNac\n3-Editar email\n4-Editar telefono\n5-Editar direccion\n6-SALIR"
    opciones = (1..6).to_a
    opcion = gets.chomp.to_i

    until opciones.include?(opcion) == true do
      puts "OPCION INVALIDA"
      puts "1-Editar nombre\n2-Editar fechaNac\n3-Editar email\n4-Editar telefono\n5-Editar direccion\n6-SALIR"
      opcion = gets.chomp.to_i
    end

    case opcion
    when 1
      puts "Ingrese nuevo nombre "
      nombre = gets.chomp
      contactoBuscado['nombre'] = nombre
    when 2
      puts "Ingrese nueva fecha de nacimiento "
      fechaNac = gets.chomp
      contactoBuscado['fechaNac'] = fechaNac
    when 3
      puts "Ingrese nuevo email "
      email = gets.chomp
      contactoBuscado["email"] = email
    when 4
      puts "Ingrese nuevo teléfono "
      telefono = gets.chomp
      contactoBuscado['telefono'] = telefono
    when 5
      puts "Ingrese nueva direccion "
      direccion = gets.chomp
      contactoBuscado['direccion'] = direccion
    when 6
      puts "bye!"
    end
    return contactoBuscado
  end

  def actualizarCsvContactos(contactosActualizados)
    CSV.open('agenda.csv','w') do |csvActualizado|
      csvActualizado.add_row(contactosActualizados.headers)
      contactosActualizados.each do |fila|
        csvActualizado.add_row(fila)
      end
    end
  end

end
