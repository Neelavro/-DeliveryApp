from django.core.files.storage import default_storage
from django.http import JsonResponse
from ..models import *
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.files.base import ContentFile


@csrf_exempt
def upload_image(request):
    if request.method == 'POST' and 'image' in request.FILES:
        image = request.FILES['image']
        # Generate a unique name for the file
        file_name = f"{uuid.uuid4()}_{image.name}"
        path = default_storage.save(f'uploads/{file_name}', ContentFile(image.read()))
        image_url = default_storage.url(path)
        print(image_url)
        return JsonResponse({"image_url": image_url}, status=200)

    return JsonResponse({"error": "No image uploaded"}, status=400)


