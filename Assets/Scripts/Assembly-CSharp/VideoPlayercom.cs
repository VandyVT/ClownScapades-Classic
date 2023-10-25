using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Video;

// Token: 0x02000035 RID: 53
public class VideoPlayercom : MonoBehaviour
{
	// Token: 0x060000E2 RID: 226 RVA: 0x000047AD File Offset: 0x000029AD
	private void Start()
	{
		base.StartCoroutine(this.PlayVideo());
	}

	// Token: 0x060000E3 RID: 227 RVA: 0x000047BC File Offset: 0x000029BC
	private IEnumerator PlayVideo()
	{
		this.videoPlayer.Prepare();
		WaitForSeconds waitForSeconds = new WaitForSeconds(1f);
		if (!this.videoPlayer.isPrepared)
		{
			yield return waitForSeconds;
		}
		this.rawImage.texture = this.videoPlayer.texture;
		this.videoPlayer.Play();
		this.audioSource.Play();
		yield break;
	}

	// Token: 0x040000BB RID: 187
	public RawImage rawImage;

	// Token: 0x040000BC RID: 188
	public VideoPlayer videoPlayer;

	// Token: 0x040000BD RID: 189
	public AudioSource audioSource;
}
