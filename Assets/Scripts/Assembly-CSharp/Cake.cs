using System;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

// Token: 0x02000022 RID: 34
public class Cake : MonoBehaviour
{
	// Token: 0x06000089 RID: 137 RVA: 0x000038F7 File Offset: 0x00001AF7
	private void Start()
	{
		this.S.clip = this.Clip;
		this.count = 0;
		this.SetCountText();
		this.winText.text = "";
	}

	// Token: 0x0600008A RID: 138 RVA: 0x00003927 File Offset: 0x00001B27
	private void OnCollisionEnter2D(Collision2D other)
	{
		if (other.gameObject.CompareTag("Cakes"))
		{
			other.gameObject.SetActive(false);
			this.count++;
			this.SetCountText();
			this.S.Play();
		}
	}

	// Token: 0x0600008B RID: 139 RVA: 0x00003968 File Offset: 0x00001B68
	private void SetCountText()
	{
		this.countText.text = "Cakes: " + this.count.ToString();
		if (this.count >= 10)
		{
			this.winText.text = "Find The Last Cake!";
			this.FinalGrass.SetActive(true);
		}
		if (this.count >= 11)
		{
			SceneManager.LoadScene("Last Scene");
		}
	}

	// Token: 0x04000078 RID: 120
	public AudioClip Clip;

	// Token: 0x04000079 RID: 121
	public AudioSource S;

	// Token: 0x0400007A RID: 122
	private int count;

	// Token: 0x0400007B RID: 123
	public Text countText;

	// Token: 0x0400007C RID: 124
	public Text winText;

	// Token: 0x0400007D RID: 125
	public GameObject FinalGrass;
}
