clean_encrypt_fields = ->
  $('#encrypt_message_encrypted').val('')
  $('#encrypt_key').val('')

encrypt_message = () ->
  $('#encrypt_message_encrypted').trigger('change')   # Auto Encrypt
  $('#encrypt_key').trigger('change')                 # Auto Encrypt

  message = $('#encrypt_message')
  if message.val() != ''
    $.getJSON "/codings/encrypt.json?message=#{message.val()}", (data) ->
      if data != null
        $('#encrypt_message_encrypted').val(data.message)
        $('#encrypt_key').val(data.key)
  else
    clean_encrypt_fields()

clean_descrypt_fields = ->
  $('#decrypt_decrypted_message').val('')

decrypt_message = () ->
  message = $('#decrypt_encrypted_message')
  key     = $('#decrypt_key')

  if message.val() != '' && key.val() != ''
    $.getJSON "/codings/decrypt.json?message=#{message.val()}&key=#{key.val()}", (data) ->
      if data != null
        $('#decrypt_decrypted_message').val(data.message)
  else
    clean_descrypt_fields()

auto_decrypt = ->
  $('#decrypt_encrypted_message').val($('#encrypt_message_encrypted').val())
  $('#decrypt_key').val($('#encrypt_key').val())
  $('#decrypt_key').trigger('keyup')
  $('#decrypt_key').trigger('keydown')

$(document).on "page:change", ->

  $('#encrypt_message').keydown ->
    encrypt_message()

  $('#encrypt_message').keyup ->
    encrypt_message()

  $('#decrypt_encrypted_message').keydown ->
    decrypt_message()

  $('#decrypt_encrypted_message').keyup ->
    decrypt_message()

  $('#decrypt_key').keydown ->
    decrypt_message()

  $('#decrypt_key').keyup ->
    decrypt_message()

  #$('#encrypt_message_encrypted').change ->
  #  auto_decrypt()

